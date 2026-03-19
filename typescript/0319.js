// const fs = require("fs");
// const input = fs.readFileSync("/dev/stdin", "utf8").split("\n");

// function main(input) {
//     const n = input.split(" ");
//     const parsed = parseInt(n, 10);
//     if (parsed >= 100) {
//         console.log("DANGER");
//     } else {
//         console.log(parsed);
//     }
// }

// main(require("fs").readFileSync("/dev/stdin", "utf8"));

// input
// 3
// 1 L 1
// 3 L 1
// 2 R 1

// function main(input) {
//     const args = input.split("\n");
//     const n = parseInt(args[0], 10);
//     const nums = args.slice(1, n + 1).map((n) => n.split(" "));
//     const left = nums.map((n) => parseInt(n[0], 10));
//     const string = nums.map((n) => n[1]);
//     const right = nums.map((n) => parseInt(n[2], 10));

//     let leftSum = 0;
//     let rightSum = 0;
//     for (i=0; i < n; i++) {
//         if (left[i] == 1) {
//             if (string[i] == "L") {
//                 leftSum += right[i];
//             } else if (string[i] == "R") {
//                 rightSum += right[i];
//             }
//         } else if (left[i] == 2) {
//             if (string[i] == "L") {
//                 leftSum -= right[i];
//             } else if (string[i] == "R") {
//                 rightSum -= right[i];
//             }
//         } else if (left[i] == 3) {
//             if (string[i] == "L") {
//                 leftSum -= right[i];
//                 rightSum += right[i];
//             } else if (string[i] == "R") {
//                 leftSum += right[i];
//                 rightSum -= right[i];
//             }
//         }


//         if (leftSum < rightSum) {
//             console.log("<");
//         } else if (leftSum > rightSum) {
//             console.log(">");
//         } else {
//             console.log("=")
//         }
//     }
// }

// main(require("fs").readFileSync("/dev/stdin", "utf8"));

function main(input) {
    let args = input.split("\n");
    const line0 = args[0].split(" ");
    const N = parseInt(line0[0], 10);
    let level = parseInt(line0[1], 10);

    const nums = args.slice(1, args.length - 1).map((n) => parseInt(n, 10));

    for (i=0; i < N; i++) {
        const obstacleLevel = nums[i];
        if (level == obstacleLevel) {
            continue
        } else if (level > obstacleLevel) {
            level += Math.floor(obstacleLevel / 2);
        } else if (level < obstacleLevel) {
            level = Math.floor(level / 2);
        }
    }

    console.log(level);
}

main(require("fs").readFileSync("/dev/stdin", "utf8"));