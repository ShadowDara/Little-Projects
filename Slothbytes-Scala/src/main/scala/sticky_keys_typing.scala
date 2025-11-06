// Slothbyts Sticky Keys Typing
// Weak 15 Year 2025
// made by Shadowdara

package de.shadowdara.sloth_bytes_scala

import scala.util.boundary
import scala.util.boundary.break

object StickyKeysTyping {
  def isLongPressed(s1: String, s2: String): Boolean = boundary[Boolean] {
    var s1_index = 0
    var s2_index = 0

    while (s2_index < s2.length) do
      if (s1_index < s1.length && s1(s1_index) == s2(s2_index)) then
        s1_index += 1
        s2_index += 1

      else if (s2_index > 0 && s2(s2_index) == s2(s2_index - 1)) then
        s2_index += 1

      else
        break(false)

    if (s1_index == s1.length)
      true
    
    else
      break(false)
  }
}
