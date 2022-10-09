// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let flights = try? newJSONDecoder().decode(Flights.self, from: jsonData)

import Foundation

// MARK: - Flight
struct Flight: Codable {
    let departure, arrival: Arrival
    let airline: Airline
    let flight: FlightClass
}

// MARK: - Airline
struct Airline: Codable {
    let name: Name
    let callsign: Callsign
    let iata: AirlineIata
    let icao: AirlineIcao
}

enum Callsign: String, Codable {
    case boraJet = "BORA JET"
    case nasExpress = "NAS EXPRESS"
    case sunexpress = "SUNEXPRESS"
    case sunturk = "SUNTURK"
    case turkish = "TURKISH"
}

enum AirlineIata: String, Codable {
    case pc = "PC"
    case tk = "TK"
    case xq = "XQ"
    case xy = "XY"
    case yb = "YB"
}

enum AirlineIcao: String, Codable {
    case brj = "BRJ"
    case kne = "KNE"
    case pgt = "PGT"
    case sxs = "SXS"
    case thy = "THY"
}

enum Name: String, Codable {
    case boraJetHavacilikTasimacilikUcakBakimOnarimVeTicaretAS = "BoraJet Havacilik Tasimacilik Ucak Bakim Onarim Ve Ticaret A.S."
    case nationalAIRSERVICESDBAFLYNAS = "NATIONAL AIR SERVICES dba FLYNAS"
    case pegasusAirlines = "Pegasus Airlines"
    case sunExpress = "SunExpress"
    case thyTurkishAirlines = "THY - Turkish Airlines"
}

// MARK: - Arrival
struct Arrival: Codable {
    let airport: Airport
    let timezone: Timezone
    let iata: ArrivalIata
    let icao: ArrivalIcao
    let terminal, time: String?
}

enum Airport: String, Codable {
    case antalya = "Antalya"
    case sabihaGokcen = "Sabiha Gokcen"
}

enum ArrivalIata: String, Codable {
    case ayt = "AYT"
    case saw = "SAW"
}

enum ArrivalIcao: String, Codable {
    case ltai = "LTAI"
    case ltfj = "LTFJ"
}

enum Timezone: String, Codable {
    case europeIstanbul = "Europe/Istanbul"
}

// MARK: - FlightClass
struct FlightClass: Codable {
    let number: String
}

typealias Flights = [Flight]
