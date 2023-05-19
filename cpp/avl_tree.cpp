#include <bits/stdc++.h>
using namespace std;

class AVL {
private:
  class Node {
  public:
    int key;
    Node *left;
    Node *right;
    int height;
    Node(int key) : key(key), left(NULL), right(NULL), height(-1) {}
  };
  Node *root;

  int height(Node *node) {
    if (node == NULL)
      return -1;
    return node->height;
  }

  int balanceFactor(Node *node) {
    if (node == NULL)
      return 0;
    return height(node->left) - height(node->right);
  }

  Node *rightRotate(Node *y) {
    Node *x = y->left;
    Node *temp = x->right;

    x->right = y;
    y->left = temp;

    y->height = max(height(y->left), height(y->right)) + 1;
    x->height = max(height(x->left), height(x->right)) + 1;

    return x;
  }

  Node *leftRotate(Node *x) {
    Node *y = x->right;
    Node *temp = y->left;

    y->left = x;
    x->right = temp;

    y->height = max(height(y->left), height(y->right)) + 1;
    x->height = max(height(x->left), height(x->right)) + 1;

    return y;
  }

  Node *insertNode(Node *node, int key) {
    if (node == NULL) {
      return new Node(key);
    }
    if (key < node->key) {
      node->left = insertNode(node->left, key);
    }
    if (key > node->key) {
      node->right = insertNode(node->right, key);
    } else {
      return node;
    }

    node->height = max(height(node->left), height(node->right)) + 1;

    int balance = balanceFactor(node);

    if (balance > 1 && key < node->left->key) {
      return rightRotate(node);
    }

    if (balance < -1 && key > node->right->key) {
      return leftRotate(node);
    }

    if (balance > 1 && key > node->left->key) {
      node->left = leftRotate(node->left);
      return rightRotate(node);
    }

    if (balance < -1 && key < node->right->key) {
      node->right = rightRotate(node->right);
      return leftRotate(node);
    }

    return node;
  }

  Node *minValueNode(Node *node) {
    Node *current = node;
    while (current->left != NULL)
      current = current->left;

    return current;
  }

  Node *deleteNode(Node *node, int key) {
    if (node == NULL)
      return node;
    if (key < node->key)
      node->left = deleteNode(node->left, key);
    else if (key > node->key)
      node->right = deleteNode(node->right, key);
    else {
      if (node->left == NULL || node->right == NULL) {
        Node *temp = node->left ? node->left : node->right;
        if (temp == NULL) {
          temp = node;
          node = NULL;
        } else {
          *node = *temp;
        }
        delete temp;
      }

      else {
        Node *temp = minValueNode(node->right);
        node->key = temp->key;
        node->right = deleteNode(node->right, temp->key);
      }
    }

    if (node == NULL)
      return node;
    node->height = max(height(node->left), height(node->right)) + 1;

    int balance = balanceFactor(node);

    if (balance > 1 && balanceFactor(node->left) >= 0)
      return rightRotate(node);

    if (balance > 1 && balanceFactor(node->left) < 0) {
      node->left = leftRotate(node->left);
      return rightRotate(node);
    }

    if (balance < -1 && balanceFactor(node->right) <= 0)
      return leftRotate(node);

    if (balance < -1 && balanceFactor(node->right) > 0) {
      node->right = rightRotate(node->right);
      return leftRotate(node);
    }

    return node;
  }

public:
  AVL() : root(NULL) {}
  void insert(int key) { root = insertNode(root, key); }

  void Delete(int key) { root = deleteNode(root, key); }
  void inorder() { inorderTraversal(root); }

  void inorderTraversal(Node *node) {
    if (node == NULL)
      return;
    inorderTraversal(node->left);
    cout << node->key << " ";
    inorderTraversal(node->right);
  }

  void preorder() { preorderTraversal(root); }
  void preorderTraversal(Node *node) {
    if (node == NULL)
      return;
    cout << node->key << " ";
    preorderTraversal(node->left);
    preorderTraversal(node->right);
  }
};

int main() {
  AVL tree;
  // tree.insert(10);
  // tree.insert(20);
  // tree.insert(30);
  // tree.insert(40);
  // tree.insert(50);
  // tree.insert(35);
  //
  // tree.inorder();
  //
  // cout << endl;
  // tree.Delete(30);
  //
  tree.insert(1);
  tree.insert(2);
  tree.insert(3);
  tree.insert(5);
  tree.insert(7);
  tree.insert(9);
  tree.insert(10);
  tree.insert(13);

  tree.inorder();
  cout << endl;
  tree.Delete(2);
  tree.inorder();
  return 0;
}
