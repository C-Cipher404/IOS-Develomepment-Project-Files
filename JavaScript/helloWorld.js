console.log("Hello, World!");

function describe(temperature){
  console.log(`The temperature is ${temperature} degrees.`);
}

for (const temp of [10, 20, 30, 40]) {
  describe(temp);
}
