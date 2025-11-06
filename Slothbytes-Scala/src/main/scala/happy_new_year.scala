// Slothbytes Happy New Year
// Week 16 Year 2025
// made by Shadowdara

package de.shadowdara.sloth_bytes_scala

import scala.util.boundary
import scala.util.boundary.break

object happy_new_year{
  def main(input: Int): Int =
    var input_va = input + 1
    if check_doubles(input_va) then
      return input_va

    else
      happy_new_year.main(input_va)
  
  def check_doubles(input: Int): Boolean = boundary[Boolean] {
    var input_str = input.toString()
    var input_index = 0

    while (input_index < input_str.length() - 1) do
      var x = input_index

      while (x < input_str.length() - 1) do
        if (input_str(input_index) == input_str(x+1)) then
          break(false)

        x += 1

      input_index += 1

    true
  }
}
