function totalDistance(leftList: number[], rightList: number[]): number {
    return [...leftList]
        .sort((a, b) => a - b)
        .map((num, i) => Math.abs(num - [...rightList].sort((a, b) => a - b)[i]))
        .reduce((acc, curr) => acc + curr, 0);
}

console.log(totalDistance([1, 2, 3, 4, 7], [3, 3, 4, 7, 9]));
