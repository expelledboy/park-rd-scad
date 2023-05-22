module fix_y() {
    hull() {
        translate([ 0, -1, 0 ]) children();
        translate([ 0, 1, 0 ]) children();
    }
}

module fix_x() {
    hull() {
        translate([ -1, 0, 0 ]) children();
        translate([ 1, 0, 0 ]) children();
    }
}

module flip_x() {
    mirror([ 1, 0, 0 ]) {
        translate([ -toilet_cubical.x, 0 ]) {
            children();
        }
    }
}
