#!/usr/bin/env node

const process = require('process')

const parse = (x) => parseInt(x, 10)

const input = process.argv.slice(2).map(parse)

console.log('input', input)

function qsort(arr, start, end) {
    if (start >= end) {
        return
    }

    let partition = end

    const pivot = arr[Math.floor((start + end) / 2)]

    let i = start
    let j = end

    while (true) {
        while (arr[i] < pivot) {
            i++
        }

        while (arr[j] > pivot) {
            j--
        }

        if (i >= j) {
            partition = j

            break
        }

        const swap = arr[i]

        arr[i] = arr[j]
        arr[j] = swap

        i++
        j--
    }
   
    qsort(arr, start, partition)
    qsort(arr, partition + 1, end)
}

qsort(input, 0, input.length - 1)

console.log('output', input)
