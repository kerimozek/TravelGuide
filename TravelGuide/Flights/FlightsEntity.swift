//
//  FlightsEntity.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 5.10.2022.
//

import Foundation

// MARK: - FlightElement
struct FlightElement: Codable {
    let departure, arrival: Arrival
    let airline: Airline
    let flight: FlightFlight
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
    case sunexpress = "SUNEXPRESS"
    case sunturk = "SUNTURK"
    case turkish = "TURKISH"
}

enum AirlineIata: String, Codable {
    case pc = "PC"
    case tk = "TK"
    case xq = "XQ"
    case yb = "YB"
}

enum AirlineIcao: String, Codable {
    case brj = "BRJ"
    case pgt = "PGT"
    case sxs = "SXS"
    case thy = "THY"
}

enum Name: String, Codable {
    case boraJetHavacilikTasimacilikUcakBakimOnarimVeTicaretAS = "BoraJet Havacilik Tasimacilik Ucak Bakim Onarim Ve Ticaret A.S."
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
    let terminal: JSONNull?
    let time: String?
}

enum Airport: String, Codable {
    case esenbogaInternational = "Esenboga International"
    case sabihaGokcen = "Sabiha Gokcen"
}

enum ArrivalIata: String, Codable {
    case esb = "ESB"
    case saw = "SAW"
}

enum ArrivalIcao: String, Codable {
    case ltac = "LTAC"
    case ltfj = "LTFJ"
}

enum Timezone: String, Codable {
    case europeIstanbul = "Europe/Istanbul"
}

// MARK: - FlightFlight
struct FlightFlight: Codable {
    let number: String
}

typealias Flights = [FlightElement]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

