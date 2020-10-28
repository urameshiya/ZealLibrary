//
//  BeatmapFile.swift
//  
//
//  Created by Chinh Vu on 10/28/20.
//

import Foundation
import CoreGraphics

struct BeatmapFile: Codable {
	struct Beat: Codable {
		let time: CGFloat
		let segment: Range<Int>
		
		// Compact storage; avoids repeated keys
		func encode(to encoder: Encoder) throws {
			var container = encoder.unkeyedContainer()
			try container.encode(time)
			try container.encode(segment)
		}
		
		init(time: CGFloat, segment: Range<Int>) {
			self.time = time
			self.segment = segment
		}
		
		init(from decoder: Decoder) throws {
			var container = try decoder.unkeyedContainer()
			time = try container.decode(CGFloat.self)
			segment = try container.decode(Range<Int>.self)
		}
	}
	
	var version: String = "1.0"
	var lyric: String
	
	/**
		Each range represents a valid segment of the lyric.

		- lowerbound is the offset from the end of the last valid segment
		- upperbound is the length of the valid segment
	*/
	var beatmap: [Beat]
	var disabledTimes: [CGFloat]
}
