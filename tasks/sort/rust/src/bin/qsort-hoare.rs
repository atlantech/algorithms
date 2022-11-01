use std::io;

fn main() {
    let mut buf: String = String::new();

    io::stdin()
        .read_line(&mut buf)
        .expect("Failed to read input");

    let tokens: Vec<&str> = buf.trim().split(" ").collect();
    let mut ints: Vec<i32> = tokens
        .iter()
        .map(|&x| x.parse().expect("Not an integer"))
        .collect();

    println!("Input: {:?}", ints);

    let start = 0;
    let end = ints.len() - 1;

    qsort(&mut ints, start, end);

    println!("Result: {:?}", ints);
}

fn qsort(input: &mut Vec<i32>, start: usize, end: usize) {
    if start >= end {
        return;
    }

    let middle = (start + end) / 2;
    let pivot;
    let mut i = start;
    let mut j = end;

    loop {
        while input[i] > input[middle] {
            i += 1;
        }

        while input[j] < input[middle] {
            j -= 1;
        }

        if i >= j {
            pivot = j;
            break;
        }

        let swap = input[i];
        input[i] = input[j];
        input[j] = swap;

        i += 1;
        j -= 1;
    }

    if pivot == 0 {
        return;
    }

    qsort(input, start, pivot);
    qsort(input, pivot + 1, end);
}
