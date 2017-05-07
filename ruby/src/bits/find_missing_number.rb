#Array from 1..n elements with one number missing. Find using bit operators

#continuous numbers differ by 1 in the LSB(1 has 1 at LSB, 2 has 0, 3 has 1 at LSB etc.)
#So traverse array and separate odd and even numbers. See which is bigger. Smaller array has 
#missing number

int findMissing(ArrayList<BitInteger> array) {
return findMissing(array, BitInteger.INTEGER_SIZE - 1);
}

int findMissing(ArrayList<BitInteger> input, int column) {
if (column < 0) { // Base case and error condition
return 0;
}
ArrayList<BitInteger> oddIndices = new ArrayList<BitInteger>();
 ArrayList<BitInteger> evenIndices = new ArrayList<BitInteger>();
 for (BitInteger t : input) {
 if (t.fetch(column) == 0) {
 evenIndices.add(t);
 } else {
 oddIndices.add(t);
 }
 }
 if (oddIndices.size() >= evenIndices.size()) {
 return (findMissing(evenIndices, column - 1)) << 1 | 0;
 } else {
 return (findMissing(oddIndices, column - 1)) << 1 | 1;
 }
 }
