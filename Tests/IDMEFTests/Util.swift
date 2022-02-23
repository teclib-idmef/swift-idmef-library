@testable import IDMEF

func message1() -> IDMEFObject {
    var msg = IDMEFObject()
    msg["Version"] = "2.0.3"
    msg["ID"] = "09db946e-673e-49af-b4b2-a8cd9da58de6"
    msg["CreateTime"] = "2021-11-22T14:42:51.881033Z"

    var analyzer = IDMEFObject()
    analyzer["IP"] = "127.0.0.1"
    analyzer["Name"] = "foobar"
    analyzer["Model"] = "generic"
    analyzer["Category"] = ["LOG"]
    analyzer["Data"] = ["Log"]
    analyzer["Method"] = ["Monitor"]

    msg["Analyzer"] = analyzer

    return msg
}

func message2() -> IDMEFObject {
	var  msg = IDMEFObject()
    msg["Version"] = "2.0.3"
    msg["ID"] = "fae2ece1-ea54-461a-bedb-953495d6d39c"
    msg["CreateTime"] = "2021-11-23T09:48:58.416374Z"

    var analyzer = IDMEFObject()
    analyzer["IP"] = "127.0.0.1"
    analyzer["Name"] = "foobar"
    analyzer["Model"] = "generic"
    analyzer["Category"] = ["LOG"]
    analyzer["Data"] = ["Log"]
    analyzer["Method"] = ["Monitor"]

    msg["Analyzer"] = analyzer

    var sensor1 = IDMEFObject()
    sensor1["IP"] = "192.168.1.1"
    sensor1["Name"] = "TheSensor"
    sensor1["Model"] = "TheSensorModel"

    var sensor2 = IDMEFObject()
    sensor2["IP"] = "192.168.1.2"
    sensor2["Name"] = "TheSensor2"
    sensor2["Model"] = "TheSensor2Model"

    msg["Sensor"] = [sensor1, sensor2]

    return msg
}