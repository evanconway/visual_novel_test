// Game Tree
/*
The game tree was designed specifically for creating dialog trees. But it could be used for
anything that uses the same structure. After creating a game tree, the tree can be 
populated with a specific style of programming.
*/

enum GAME_TREE {
	BRANCH,
	DEPTH,
	DATA,
	TARGETS
}

function game_tree() constructor{
	
	/*
	Each element in the tree is an array containing:
	[branch, branch_depth, data, targets]
	*/
	tree = [];
	
	branch = -1; // integer id of branch of each step
	
	/*
	In our design, "depth" is not traditional tree depth. Instead we think of the first 
	branch as being on the main "depth". Each branch that deviates from this first depth
	is considered to be one depth lower. Think of depth as how far a branch has deviated
	from the original branch. 
	*/
	branch_depth = 0; // depth of each step
	create_new_branch = true; // flag for creating new branch
	
	/// @func add(data, *branches...)
	add = function(_data) {
		
		/*
		The optional *branches... parameter is for functions that also populate the tree.
		They are executed as sub trees of the current tree. The add function is designed
		this way so the code visually looks like the tree as you're making it. This makes
		it easier to make changes right in game maker on the fly. 
		*/
	
		if (create_new_branch) branch++;
		
		var step = [branch, branch_depth, _data, []]
		var step_prev = array_length(tree) > 0 ? tree[array_length(tree) - 1] : undefined;
		array_push(tree, step);
		if (step_prev == undefined) return; // end function if first step
		var curr_step_id = array_length(tree) - 1;
		
		// execute branch functions
		for (var i = 1; i < argument_count; i++) {
			method(undefined, argument[i]);
		}
		
		// If the previous step is in the same branch as the current, add current step index as target of previous step.
		if (step_prev[GAME_TREE.BRANCH] == branch) {
			array_push(step_prev[GAME_TREE.TARGETS], curr_step_id);
		}
		
		// If the current step is the beginning of a branch, add the current step index as a target for the last step in the next highest depth. 
		if (create_new_branch) {
			// find last step in higher depth (remember lower number is higher depth)
		}
		
		// always reset create new branch.
		create_new_branch = false
	}
}
