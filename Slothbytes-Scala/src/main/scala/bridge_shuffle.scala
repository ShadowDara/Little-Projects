// Slothbytes Bridge Shuffle
// Week 12 Year 2025
// made by Shadowdara

package de.shadowdara.sloth_bytes_scala

import scala.collection.mutable.ArrayBuffer

object bridge_shuffle {
  def make_shuffle(arr1: Seq[Any], arr2: Seq[Any]): Array[Any] = 
    val arr3 = ArrayBuffer[Any]()
    var x = 0
    var do_run = true
  
    while (x < arr1.length || x < arr2.length) do

      if (x < arr1.length) then
        arr3.append(arr1(x))

      if (x < arr2.length) then
        arr3.append(arr2(x))

      x += 1
    
    val arrAsArray: Array[Any] = arr3.toArray
    return arrAsArray
}
