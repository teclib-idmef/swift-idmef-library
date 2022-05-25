/*
 * Copyright (C) 2022 Teclib'
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation
@testable import IDMEF

public class IDMEFExample {
    public static func message1(fixed: Bool? = true) -> IDMEFObject {
        var msg = IDMEFObject()
        msg["Version"] = "2.0.3"
        msg["ID"] = (fixed! as Bool) ? "09db946e-673e-49af-b4b2-a8cd9da58de6" : UUID().uuidString
        msg["CreateTime"] = "2021-11-22T14:42:51.881033Z"

        var analyzer = [AnyHashable:Any]()
        analyzer["IP"] = "127.0.0.1"
        analyzer["Name"] = "foobar"
        analyzer["Model"] = "generic"
        analyzer["Category"] = ["LOG"]
        analyzer["Data"] = ["Log"]
        analyzer["Method"] = ["Monitor"]

        msg["Analyzer"] = analyzer

        return msg
    }

    static func string1() -> String {
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

    public static func message2(fixed: Bool? = true) -> IDMEFObject {
        var  msg = IDMEFObject()
        msg["Version"] = "2.0.3"
        msg["ID"] = (fixed! as Bool) ? "fae2ece1-ea54-461a-bedb-953495d6d39c" : UUID().uuidString
        msg["CreateTime"] = "2021-11-23T09:48:58.416374Z"

        var analyzer = [AnyHashable:Any]()
        analyzer["IP"] = "127.0.0.1"
        analyzer["Name"] = "foobar"
        analyzer["Model"] = "generic"
        analyzer["Category"] = ["LOG"]
        analyzer["Data"] = ["Log"]
        analyzer["Method"] = ["Monitor"]

        msg["Analyzer"] = analyzer

        var sensor1 = [AnyHashable:Any]()
        sensor1["IP"] = "192.168.1.1"
        sensor1["Name"] = "TheSensor"
        sensor1["Model"] = "TheSensorModel"

        var sensor2 = [AnyHashable:Any]()
        sensor2["IP"] = "192.168.1.2"
        sensor2["Name"] = "TheSensor2"
        sensor2["Model"] = "TheSensor2Model"

        msg["Sensor"] = [sensor1, sensor2]

        return msg
    }

    static func string2() -> String {
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

}
