// Slothbytes Message from Space
// Week 14 Year 2025
// made by Shadowdara

package de.shadowdara.sloth_bytes_scala

import scala.collection.mutable.Stack
import scala.io.StdIn

object message_from_space {
  def spaceMessage(s: String): String =
    val stack = Stack[String]()
    val current = new StringBuilder()
    var num = 0

    for (c <- s)
      if (c.isDigit)
        num = num * 10 + (c - '0')

      else if (c == '[')
        stack.push(current.toString())
        current.clear()

      else if (c == ']')
        val repeated = current.toString() * num
        current.clear()
        current.append(stack.pop())
        current.append(repeated)
        num = 0

      else
        current.append(c)

    current.toString()
}
