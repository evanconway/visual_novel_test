/// @desc Define The Game Tree
/*
This data structure is a tree designed specifically for character dialog. However it could 
easily be used for anything with a similar structure. The data structure itself is nothing 
special. It's just a directed graph. What makes this special is the set of functions for
filling the tree, which make it easy to create complex dialog trees directly in game maker.
*/

tree = [];
current_node_index = 0;

/// @func add_step(data, *branches...)
add_step = function(_data) {
	var _node = {
		data: _data,
		branches: []
	}
	array_push(tree, _node);
	
	for (var i = 1; i < argument_count; i++) {
		/*
		If a step contains multiple branches, the functions that create those branches will
		be executed here. Note that each node in the tree also logs the starting index of
		each child branch. The index of the first child will always be the index of the
		node + 1. Notice how the branch function is executed after setting the branch index
		in the node. This ensures that the index will be correct for the next branch 
		function. 
		*/
		_node.branches[i - 1] = array_length(tree);
		//argument[i]();
	}
}

/// @desc Return true if current node has no children.
/// @func tree_at_end()
tree_at_end = function() {
	return (array_length(tree[current_node_index].branches) <= 0);
}

/// @desc Advance tree to given child branch, default branch is 0 if none provided.
/// @func tree_advance(*branch)
tree_advance = function() {
	if (!tree_at_end()) {
		current_node_index = argument_count > 0 ? argument[0] : 0;
	}
}

/// @func tree_get_data()
tree_get_data = function() {
	return tree[current_node_index].data;
}
