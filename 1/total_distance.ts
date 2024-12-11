import * as fs from 'fs';

function parseInput(filename: string): { leftList: number[], rightList: number[] } {
    const fileContent = fs.readFileSync(filename, 'utf-8');
    const lines = fileContent.trim().split('\n');
    
    const leftList: number[] = [];
    const rightList: number[] = [];
    
    lines.forEach(line => {
        const [left, right] = line.trim().split(/\s+/).map(Number);
        leftList.push(left);
        rightList.push(right);
    });
    
    return { leftList, rightList };
}

function totalDistance(leftList: number[], rightList: number[]): number {
    return [...leftList]
        .sort((a, b) => a - b)
        .map((num, i) => Math.abs(num - [...rightList].sort((a, b) => a - b)[i]))
        .reduce((sum, curr) => sum + curr, 0);
}

function similarityScore(leftList: number[], rightList: number[]): number {
    return leftList.map((num, i) => num * rightList.filter(n => n === num).length).reduce((sum, curr) => sum + curr, 0);
}

const { leftList, rightList } = parseInput('1-input.txt');
console.log(totalDistance(leftList, rightList));
console.log(similarityScore(leftList, rightList));
