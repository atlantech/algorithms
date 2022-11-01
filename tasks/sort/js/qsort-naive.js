#!/usr/bin/env node

const process = require('process');

const parse = (x) => parseInt(x, 10)

const input = process.argv.slice(2, process.argv.length).map(parse)

console.log('input', input)

function qsort(arr) {
    if (arr.length <= 1) {
        return arr;
    }

    const split = Math.floor(arr.length / 2)
    
    const left = []
    const middle = []
    const right = []

    arr.forEach((value) => {
        if (value === arr[split]) {
            return middle.push(value)
        }

        if (value > arr[split]) {
            return left.push(value)
        }
        
        return right.push(value)
    })
    
    return qsort(left).concat(middle).concat(qsort(right))
}

console.log('output', qsort(input))
