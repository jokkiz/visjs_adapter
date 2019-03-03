@JS()
library visjs_adapter;

import 'package:js/js.dart';
import 'dart:html';

@JS("vis.DataSet")
class DataSet {
  external factory DataSet(List<DataSetOption> options);
}

@JS()
@anonymous
class DataMovesSet {
  external factory DataMovesSet({int from, int to}); 
  external int get from;
  external int get to;
}

@JS()
@anonymous
class DataSetOption {
  external factory DataSetOption({int id, String label, int from, int to});
  external int get id;
  external String get label;
  external int get from;
  external int get to;
}

@JS("vis.Network")
class Network {
  external factory Network(DivElement container, NetworkData data, NetworkOptions options);
}

@JS()
@anonymous
class NetworkData {
  external factory NetworkData({DataSet nodes, DataSet edges});
  external DataSet get nodes;
  external DataSet get edges;
}

@JS()
@anonymous
class NetworkOptions {
  external factory NetworkOptions(PhysicsOptions physics);
}

@JS()
@anonymous
class PhysicsOptions {
  external factory PhysicsOptions({String solve});
  external String get solve;
}

void main() {
  List<DataSetOption> listNodesOptions = new List<DataSetOption>();

  for (int i = 1; i <= 5; i++) {
    listNodesOptions.add(DataSetOption(id: i, label: 'Node $i'));  
  }

  //DataSet nodes = DataSet(listNodesOptions);

  List<DataSetOption> edges = new List<DataSetOption>();
  edges.add(DataSetOption(from: 1, to: 2));
  edges.add(DataSetOption(from: 1, to: 3));
  edges.add(DataSetOption(from: 2, to: 4));
  edges.add(DataSetOption(from: 2, to: 5));


  var container = querySelector('#output');
  var data = new NetworkData(nodes: DataSet(listNodesOptions), edges: DataSet(edges));
  var network = new Network(container, data, NetworkOptions(PhysicsOptions(solve:'barnesHut')));
}