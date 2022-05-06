side = 10;

module tetrahedron(side) {
  faces = [
    [1, 2, 3],
    [0, 1, 2],
    [1, 0, 3],
    [2, 3, 0]
  ];
  points = [
    [0, 0, side * sin(60)],
    [-side / 2, side * sin(30) / 2, 0],
    [side / 2, side * sin(30) / 2, 0],
    [0, -side * sin(60) + side * sin(30) / 2, 0]
  ];
  polyhedron(points, faces);
}

module inset_tetrahedron(side, inset) {
  tetrahedron(side);
  cylinder(inset, r=20, $fn=3);
}

inset_tetrahedron(25,2.5);