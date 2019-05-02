package mini;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
using haxe.macro.Tools;

class Macros {
	// UNIFY(opt, t_opt) and MERGE(opt, custom);
	static public function mergeAnon(t_opt: Type, opt: Expr, custom: Expr):Expr {
		if (t_opt == null)
			throw "t_opt is null";
		var fields: Array<ObjectField> = null;
		var opt = switch(opt.expr) {
		case EConst(CIdent("null")) | EBlock([]): // null or {}
			fields = [];
			{expr: EObjectDecl(fields), pos: opt.pos};
		case EObjectDecl(defs):
			switch( Context.follow(t_opt) ) {
			case TAnonymous(_.get() => anon):
				var map = new Map<String,Type>();
				for (f in anon.fields) {
					map.set(f.name, f.type);
				}
				for (f in defs) {
					var t = map.get(f.field);
					if (t == null) {
						Context.fatalError("Unsupported field: " + f.field, f.expr.pos);
					}
					switch( Context.follow(t) ){
					case TFun(args, ret):
						switch(f.expr.expr){
						case EFunction(null, fun):
							if (fun.ret == null) {
								fun.ret = ret.toComplexType();
							}
							var srcLen = args.length;
							var dstLen = fun.args.length;
							if (dstLen > srcLen) {
								Context.fatalError("Invalid Function Arguments", f.expr.pos);
							}
							for (i in 0...srcLen) {
								var src = args[i];
								var dst = fun.args[i];
								if (dst == null) {
									fun.args[i] = {
										name: src.name,
										type: src.t.toComplexType(),
										opt: src.opt
									}
								} else if (dst.type == null) {
									dst.type = src.t.toComplexType();
									dst.opt = src.opt;
								}
							}
						case _:
							Context.fatalError("Unsupported field type: " + f.field, f.expr.pos);
						}
					case _:
					}
				}
			case _:
			}
			var unify = Context.unify(Context.typeof(opt), t_opt);
			if (!unify) {
				Context.fatalError("Unsupported argument: ", opt.pos);
			}
			fields = defs;
			opt;
		case _:
			Context.fatalError("Unsupported argument: ", opt.pos);
		}

		// merge to opt
		switch(custom.expr) {
		case EConst(CIdent("null")) | EBlock([]):
		case EObjectDecl(defs):
			for (item in defs) {
				fields.push(item);
			}
		case _:
			Context.warning("the param will be ignored", custom.pos);
		}

		// TODO: ??? define a new type by fields
		return opt;
	}

	// since we can't access private Type by `Context.getType("wx._App.Options")`
	// https://github.com/HaxeFoundation/haxe/issues/3589
	static public function getPrivateType(fullmod: String, prisub:String): Type {
		var modules = Context.getModule(fullmod);
		var a = fullmod.split(".");
		var last = a.length - 1;
		a[last] = "_" + a[last];
		a.push(prisub);
		var full = a.join(".");
		for (t in modules) {
			if (t.toString() == full) {
				return t;
			}
		}
		return null;
	}
}