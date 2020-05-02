import ArgumentParser
import Foundation
import SwiftJWT
let hours_to_live = 24

struct MyClaims: Claims {
    let iss: String
    let iat: Int
    let exp: Int
}

struct Repeat: ParsableCommand {
    
    @Option(name: .shortAndLong, help: "private_key")
    var private_key: String?
    
    @Option(name: .shortAndLong, help: "keyId")
    var keyId: String?
    
    @Option(name: .shortAndLong, help: "teamId")
    var teamId: String?

    func run() throws {
        guard let pk = private_key else {
            return
        }
        guard let id = keyId else {
            return
        }
        guard let team = teamId else {
            return
        }
        
        let time_now = Int(Date().timeIntervalSince1970)
        let time_expired = time_now + hours_to_live * 3600
        
        print("\(time_now)")
        print("\(time_expired)")
        let header = Header(kid: id)
        let payload = MyClaims(iss: team, iat: time_now, exp: time_expired)
        var myJWT = JWT(header: header, claims: payload)
        let privateKeyPath = URL(fileURLWithPath: pk)
        let privateKey: Data = try Data(contentsOf: privateKeyPath, options: .alwaysMapped)
        if #available(OSX 10.13, *) {
            let jwtSigner = JWTSigner.es256(privateKey: privateKey)
            if let token = try? myJWT.sign(using: jwtSigner) {
                print("\(token)")
            }else {
                print("Failed")
            }
        } else {
            
        }
        
        
        
    }
}

Repeat.main()
