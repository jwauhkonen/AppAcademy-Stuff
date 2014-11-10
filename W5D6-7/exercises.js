var mergeSort = function (array) {
	if (array.length < 2) {
		return array;
	}
	
	var middle = Math.floor(array.length/2);
	var left = mergeSort(array.slice(0, middle));
	var right = mergeSort(array.slice(middle));
	
	return merge(left, right);
	
}

var merge = function (left, right) {
	var sorted = [];
	
	while (left.length > 0 && right.length > 0) {
		if (left[0] < right[0]) {
			sorted.push(left.shift());
		} else {
			sorted.push(right.shift());
		}
	}
	
	if (left.length > 0) {
		sorted = sorted.concat(left);
	}
	
	if (right.length > 0) {
		sorted = sorted.concat(right);
	}
	
	return sorted;
}

// console.log(mergeSort([3, 5, 6, 2, 5, 7, 9, 3, 1, 2, 1, 4, 5, 1,]));

function subsets (array) {
	if (array.length === 0) {
		return [[]];
	}
	
	var firstEl = array[0];
	var subSubs = subsets(array.slice(1));
	
	var newSubs = subSubs.map(function(subSub) {
		return [firstEl].concat(subSub);
	});
	
	return subSubs.concat(newSubs);
}

console.log(subsets([1,2,3]));