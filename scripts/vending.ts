import { getContractFactory } from "@nomiclabs/hardhat-ethers/types";
import {ethers} from "hardhat"

async function main(){
const VendingMachine = await ethers.getContractFactory("VendingMachine")

const vendingMachine = await VendingMachine.deploy();
await vendingMachine.deployed();

console.log(`Vending Machine contract address is ${vendingMachine.address}`)

const getVendingBalance = await vendingMachine.getVendingMachineBalance();
console.log(`vending machine Balance is ${getVendingBalance}`);

const price = ethers.utils.parseEther("4")

await vendingMachine.purchase(2, {value:price});



}
main().catch((error)=>{
    console.error(error);
    process.exitCode=1;
})