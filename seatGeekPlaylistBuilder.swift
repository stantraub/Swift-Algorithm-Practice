// You've been tasked with building a playlist of tracks so that users can preview
// songs by different artists playing at a concert they want to attend
// Implement the build function such that it returns an array of tracks that meet the following conditions:
// The "primary" artists' songs should be played first
// A track from each artist should be played before we play a second track from any given artist.
// Artists can have any number of associated tracks.


//Example Usage

// let artists: [Artist] = [
    // Artist(isPrimary: false, tracks: ["A", "B", "C"],
    // Artist(isPrimary: true, tracks: ["D", "E"]),
    // Artist(isPrimary: false, tracks: ["G", "H", "I"],
// ]

// let playlistBuilder: PlaylistBuilder = PlaylistBuilder(artists: artists)
// let tracks: [String] = playlistBuilder.build()

// print(tracks)
// Prints ["D", "A", G", "E", "B", "H", "C", "I")
/// 1 primary artist
/// 2 seondary artist at least once
/// 3 secondary artist second track, if available

struct Artist {
    let isPrimary: Bool
    let tracks: [String]
}

struct PlaylistBuilder {
    let artists: [Artist]
    
    func build() → [String] {
        // place all primary artists first and then append secondary artists
        let primary = artists.filter { $0.isPrimary }
        let secondary = artists.filter { !$0.isPrimary }
        let sorted = primary + secondary
        return roundRobin(sorted)
    }
    
    func roundRobin(_ artists: [Artist]) -> [String] {
        var result = [String]()
        
        var queue = artists.map { $0.tracks }
        
        while true {
            var added = false
            
            for i in 0..<queue.count {
                if let track = queue[i].first {
                    result.append(track)
                    queue[i].removeFirst()
                    added = true
                }
            }
            
            if !added { break }
        }
        
        return result
    }

}


// solution is a round robin approach
