import Foundation

/// Menu-exposed user preferences. Reads go straight to UserDefaults so the
/// background resume-save queue always sees the latest menu choice.
enum SPUserPreferences {
    static let recordHistoryKey = "sp.pref.recordHistory"
    static let resumePlaybackKey = "sp.pref.resumePlayback"
    static let verticalArrowsSeekKey = "sp.pref.verticalArrowsSeek"

    /// When off, nothing is added to Recent Plays and no resume positions are
    /// written. Existing history is left alone; Clear History removes it.
    static var recordHistory: Bool {
        get { UserDefaults.standard.object(forKey: recordHistoryKey) as? Bool ?? true }
        set { UserDefaults.standard.set(newValue, forKey: recordHistoryKey) }
    }

    /// When off, every open starts from the beginning and no resume positions
    /// are written.
    static var resumePlayback: Bool {
        get { UserDefaults.standard.object(forKey: resumePlaybackKey) as? Bool ?? true }
        set { UserDefaults.standard.set(newValue, forKey: resumePlaybackKey) }
    }

    /// When on, ↑/↓ seek ±30 s instead of changing the volume.
    static var verticalArrowsSeek: Bool {
        get { UserDefaults.standard.object(forKey: verticalArrowsSeekKey) as? Bool ?? true }
        set { UserDefaults.standard.set(newValue, forKey: verticalArrowsSeekKey) }
    }
}
