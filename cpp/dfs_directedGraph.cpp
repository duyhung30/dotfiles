#include <iostream>
#include <list>

using namespace std;
class Graph {
  int V;          // number of vertices
  list<int> *adj; // adjacency list

public:
  Graph(int V);                    // constructor
  void addEdge(int v, int w);      // function to add an edge
  void DFS(int s, bool visited[]); // DFS algorithm
};

Graph::Graph(int V) {
  this->V = V;
  adj = new list<int>[V];
}

void Graph::addEdge(int v, int w) { adj[v].push_back(w); }

void Graph::DFS(int s, bool visited[]) {
  visited[s] = true;
  cout << s << " ";

  for (auto i = adj[s].begin(); i != adj[s].end(); ++i) {
    if (!visited[*i]) {
      DFS(*i, visited);
    }
  }
}
int main() {
  int n;
  cin >> n;
  Graph g(n);
  int x, y;
  for (int i = 0; i < n; i++) {
    cin >> x >> y;
    g.addEdge(x, y);
  }
  bool visited[n];
  for (int i = 0; i < n; i++) {
    visited[i] = false;
  }

  int root;
  cin >> root;
  g.DFS(root, visited);
  return 0;
}
