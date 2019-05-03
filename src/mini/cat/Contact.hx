package mini.cat;

import mini.Data;

@:require(!mini_game)
@:native("wx")
extern class Contact {
	static function addPhoneContact(obj:SFC<ErrMsg> & ContactInfo):Void;
}

typedef ContactInfo = {
	firstName: String,
	?photoFilePath: String,
	?nickName: String,
	?lastName: String,
	?middleName: String,
	?remark: String,
	?mobilePhoneNumber: String,
	?weChatNumber: String,
	?addressCountry: String,
	?addressState: String,
	?addressCity: String,
	?addressStreet: String,
	?addressPostalCode: String,
	?organization: String,
	?title: String,
	?workFaxNumber: String,
	?workPhoneNumber: String,
	?hostNumber: String,
	?email: String,
	?url: String,
	?workAddressCountry: String,
	?workAddressState: String,
	?workAddressCity: String,
	?workAddressStreet: String,
	?workAddressPostalCode: String,
	?homeFaxNumber: String,
	?homePhoneNumber: String,
	?homeAddressCountry: String,
	?homeAddressState: String,
	?homeAddressCity: String,
	?homeAddressStreet: String,
	?homeAddressPostalCode: String,
}
