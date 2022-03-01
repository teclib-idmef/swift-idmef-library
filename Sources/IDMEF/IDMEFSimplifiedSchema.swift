
let IDMEFSimplifiedSchemaString = """
{
	"$schema": "http://json-schema.org/draft-04/schema#",
	"type": "object",
	"title": "IDMEF v0.2 simplified",
	"description": "JSON schema for the Intrusion Detection Message Exchange Format (IDMEF) version 2 (revision 0.3)",

	"definitions": {
		"uuidType": {
			"description": "Canonical textual representation for an UUID, as defined in RFC 4122 (e.g. \"e5f9bbae-163e-42f9-a2f2-0daaf78fefb1\")",
			"type": "string",
			"pattern": "^[0-9A-Fa-f]{8}(-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$"
		},
		"timestampType": {
			"description": "A JSON string containing a timestamp conforming to the format given in section 5.6 of RFC 3339.",
			"type": "string",
			"pattern": "^[0-9]{4}-(0[0-9]|1[012])-([0-2][0-9]|3[01])T([0-1][0-9]|2[0-3]):[0-5][0-9]:([0-5][0-9]|60)(\\.[0-9]+)?(Z|[-+]([0-1][0-9]|2[0-3]):[0-5][0-9])?$"
		},
		"ipAddressType": {
			"description": "An Internet Protocol address, either version 4 or version 6.",
			"type": "string",
			"pattern": "^(((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)|([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))$"
		},
		"analyzerCategoryEnum": {
			"description": "Possible analyzer categories",
			"enum": [
				"1DLiS",
				"2DLiS",
				"3DLiS",
				"1DLaS",
				"2DLaS",
				"3DLaS",
				"VAD",
				"HAR",
				"FRC",
				"VNIR",
				"SWIR",
				"LWIR",
				"MWIR",
				"ADS",
				"ODC",
				"WEA",
				"DDOS",
				"SPAM",
				"AV",
				"EDR",
				"FW",
				"NIDS",
				"HIDS",
				"WIDS",
				"PROX",
				"WAF",
				"HPT",
				"LOG",
				"IAM",
				"VPN",
				"ETL",
				"RASP",
				"BAST",
				"NAC",
				"SIEM",
				"NMS"
			]
		},
		"analyzerDataEnum": {
			"description": "Possible types of data/sensors",
			"enum": [
				"Light",
				"Noise",
				"Touch",
				"Images",
				"Vibration",
				"Lidar",
				"Thermic",
				"Seismic",
				"Temperature",
				"Rain",
				"Water",
				"Humidity",
				"Particles",
				"Contact",
				"MagneticField",
				"Acoustics",
				"Fog",
				"External",
				"Reporting",
				"Connection",
				"Datagram",
				"Content",
				"Data",
				"File",
				"Flow",
				"Log",
				"Protocol",
				"Host",
				"Network",
				"Alert",
				"Relay",
				"Auth",
				"SNMP"
			]
		},
		"analyzerMethodEnum": {
			"description": "Possible detection methods",
			"enum": [
				"Biometric",
				"Signature",
				"Monitor",
				"Policy",
				"Statistical",
				"AI",
				"Heat",
				"Movement",
				"Blackhole",
				"Heuristic",
				"Integrity",
				"Honeypot",
				"Tarpit",
				"Recon",
				"Correlation",
				"Threshold"
			]
		}
	},

	"required": [
		"Version",
		"ID",
		"CreateTime",
		"Analyzer"
	],

	"additionalProperties": false,

	"properties": {
		"Version": {
			"description": "Version of the IDMEFv2 Format",
			"enum": ["2.0.3"]
		},
		"ID": {
			"description": "128-bit Universally Unique IDentifier (UUID), either UUID version 4 (random) or 5 (SHA-1)",
			"$ref": "#/definitions/uuidType"
		},
		"CreateTime": {
			"description": "Message creation timestamp. May point out delay between detection and processing of data.",
			"$ref": "#/definitions/timestampType"
		},
		"Analyzer": {
			"description": "The Analyzer class identifies the analyzer from which the message originates.",
			"type": "object",
			"required": [
				"IP",
				"Name",
				"Model",
				"Category",
				"Data",
				"Method"
			],

			"additionalProperties": false,
			"properties": {
				"IP": {
					"description": "IP address (either version 4 or version 6)",
					"$ref": "#/definitions/ipAddressType"
				},
				"Name": {
					"description": "Name of the analyzer, which must be reasonably unique, however still bear some meaningful sense. Usually denotes hierarchy of organizational units which detector belongs to and its own name or it can distinguish multiple analyzers running with the same IP.",
					"type": "string"
				},
				"Model": {
					"description": "Generic name, brand, version",
					"type": "string"
				},
				"Category": {
					"description": "Analyzer categories",
					"type": "array",
					"items": {
						"$ref": "#/definitions/analyzerCategoryEnum"
					}
				},
				"Data": {
					"description": "Data analyzed for detection",
					"type": "array",
					"items": {
						"$ref": "#/definitions/analyzerDataEnum"
					}
 				},
				"Method": {
					"description": "Detection method",
					"type": "array",
					"items": {
						"$ref": "#/definitions/analyzerMethodEnum"
					}
				}
			}
		}
	}
}
"""