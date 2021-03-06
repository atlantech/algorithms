function search(list, elem) {
    let max = list.length - 1;
    let min = 0;

    while (min <= max) {
        const middle = Math.round(min + (max - min)/ 2);

        const value = list[middle];

        if (value < elem) {
            min = middle + 1;
        } else if (value > elem) {
            max = middle - 1;
        } else {
            return middle;
        }
    }

    return null;
}

console.log(search([1,3,5,7,9,11], 9));