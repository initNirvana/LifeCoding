# -*- coding: utf-8 -*-

class Node(object):
    def __init__(self, value):
        self.right = None
        self.left = None
        self.parent = None
        self.value = value

    def __repr__(self):
        return "Node value {}".format(self.value)

class BinaryTree(object):
    def __init__(self):
        self.root = None
        self.len = 0

    def __len__(self):
        return self.len

    def is_empty(self):
        return self.root == None
    
    def _inorder(self, node, values):
        if node != None:
            self._inorder(node.left, values)
            values.append(node.values)
            self._inorder(node.right, values)

    def _preorder(self, node, values)
        if node != None:
            values.append(node.value)
            self._preorder(node.left, values)
            self._preorder(node.right, values)

    def _postorder(self, node, values):
        if node != None:
            self._postorder(node.left, values)
            self._postorder(node.right, values)
            values.append(node.value)

    def insert(self, value):
        new_node = Node(value)
        if self.is_empty():
            self.root = new_node
        else:
            node = self.root
            while node and node.value != value:
                if node.value == value:
                  return
                parent = node
                if node.value < value:
                    node = node.right
                else:
                    node = node.left
            if parent.value > value:
                parent.left = new_node
            else:
                parent.right = new_node
            new_node.parent = parent
        self.len += 1
        return

