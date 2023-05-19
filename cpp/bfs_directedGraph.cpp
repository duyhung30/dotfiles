#include <iostream>
#include <list>
#include <queue>

using namespace std;

class Graph {
private:
  int V;          // number of vertices
  list<int> *adj; // adjacency list

public:
  Graph(int V);               // constructor
  void addEdge(int v, int w); // function to add an edge
  void BFS(int s);            // BFS algorithm
};

Graph::Graph(int V) {
  this->V = V;
  adj = new list<int>[V];
}

void Graph::addEdge(int v, int w) { adj[v].push_back(w); }

void Graph::BFS(int s) {
  bool *visited = new bool[V];
  for (int i = 0; i < V; i++) {
    visited[i] = false;
  }

  queue<int> q;
  visited[s] = true;
  q.push(s);

  while (!q.empty()) {
    s = q.front();
    cout << s << " ";
    q.pop();

    for (auto i = adj[s].begin(); i != adj[s].end(); ++i) {
      if (!visited[*i]) {
        visited[*i] = true;
        q.push(*i);
      }
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
  int root;
  cin >> root;
  g.BFS(root);
  return 0;
}
