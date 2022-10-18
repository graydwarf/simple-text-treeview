extends Control

onready var _tree = $VBoxContainer/Tree
onready var _output = $VBoxContainer/OutputLineEdit

func _ready():
	randomize()
	InitTree()

func InitTree():
	var root = _tree.create_item()
	_tree.set_hide_root(true)
	AddOneSimpleNode(root)
	CreateRandomNodes(root,  3)

func AddOneSimpleNode(parentNode):
	var node = _tree.create_item(parentNode)
	node.set_text(0, "First simple node")
	
	var subnode = _tree.create_item(node)
	subnode.set_text(0, "Child node of first node")

func CreateRandomNodes(parentNode, nodeCount):		
	for i in nodeCount:
		var node = CreateNode(parentNode)
		node.set_text(0, GetRandomString() + "_" + str(randi() % 9999))
		CreateRandomNodes(node, nodeCount - 1)
		
func CreateNode(parentNode):
	return _tree.create_item(parentNode)

func GetRandomString():
	var rnd = randi() % 7
	if rnd == 0:
		return "Sleepy"
	elif rnd == 1:
		return "Happy"
	elif rnd == 2:
		return "Grumpy"
	elif rnd == 3:
		return "Sneezy"
	elif rnd == 4:
		return "Bashful"
	elif rnd == 5:
		return "Doc"
	elif rnd == 6:
		return "Dopey"

func TreeNodeSelected():
	var selectedNode = _tree.get_selected()
	var treeNodePath = selectedNode.get_text(0)
	while selectedNode.get_parent() != null:
		selectedNode = selectedNode.get_parent()
		treeNodePath = selectedNode.get_text(0) + "/" + treeNodePath
	_output.text = treeNodePath
	
func _on_Tree_item_selected():
	TreeNodeSelected()
	
