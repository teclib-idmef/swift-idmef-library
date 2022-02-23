@testable import IDMEF

func message1() -> IDMEFObject {
    var msg = IDMEFObject()
    msg.Version = "2.0.3"
    msg.ID = "09db946e-673e-49af-b4b2-a8cd9da58de6"
    msg.CreateTime = "2021-11-22T14:42:51.881033Z"

    var analyzer = Analyzer()
    analyzer.IP = "127.0.0.1"
    analyzer.Name = "foobar"
    analyzer.Model = "generic"
    analyzer.Category = ["LOG"]
    analyzer.Data = ["Log"]
    analyzer.Method = ["Monitor"]

    msg.Analyzer = analyzer

    return msg
}

func string1() -> String {
    return  "{\n" +
            "\"Version\":\"2.0.3\",\n" +
            "\"CreateTime\":\"2021-11-22T14:42:51.881033Z\",\n" +
            "\"ID\":\"09db946e-673e-49af-b4b2-a8cd9da58de6\",\n" +
            "\"Analyzer\":{\n" +
            "\"Category\":[\"LOG\"],\n" +
            "\"IP\":\"127.0.0.1\",\n" +
            "\"Model\":\"generic\",\n" +
            "\"Data\":[\"Log\"],\n" +
            "\"Method\":[\"Monitor\"],\n" +
            "\"Name\":\"foobar\"\n" +
            "}\n" +
            "}\n"
}

func message2() -> IDMEFObject {
	var  msg = IDMEFObject()
    msg.Version = "2.0.3"
    msg.ID = "fae2ece1-ea54-461a-bedb-953495d6d39c"
    msg.CreateTime = "2021-11-23T09:48:58.416374Z"

    var analyzer = Analyzer()
    analyzer.IP = "127.0.0.1"
    analyzer.Name = "foobar"
    analyzer.Model = "generic"
    analyzer.Category = ["LOG"]
    analyzer.Data = ["Log"]
    analyzer.Method = ["Monitor"]

    msg.Analyzer = analyzer

    var sensor1 = Sensor()
    sensor1.IP = "192.168.1.1"
    sensor1.Name = "TheSensor"
    sensor1.Model = "TheSensorModel"

    var sensor2 = Sensor()
    sensor2.IP = "192.168.1.2"
    sensor2.Name = "TheSensor2"
    sensor2.Model = "TheSensor2Model"

    msg.Sensor = [sensor1, sensor2]

    return msg
}

func string2() -> String {
    return "{\"Version\": \"2.0.3\",\n" +
            "\"CreateTime\":\"2021-11-23T09:48:58.416374Z\",\n" +
            "\"ID\":\"fae2ece1-ea54-461a-bedb-953495d6d39c\",\n" +
            " \"Analyzer\": {\"IP\": \"127.0.0.1\",\n" +
            "\t      \"Name\": \"foobar\",\n" +
            "\t      \"Model\": \"generic\",\n" +
            "\t      \"Category\": [\"LOG\"],\n" +
            "\t      \"Data\": [\"Log\"],\n" +
            "\t      \"Method\": [\"Monitor\"]},\n" +
            " \"Sensor\": [{\"IP\": \"192.168.1.1\",\n" +
            "\t     \"Name\": \"TheSensor\",\n" +
            "\t     \"Model\": \"TheSensorModel\"},\n" +
            "\t    {\"IP\": \"192.168.1.2\",\n" +
            "\t     \"Name\": \"TheSensor2\",\n" +
            "\t     \"Model\": \"TheSensor2Model\"}]}\n"
}