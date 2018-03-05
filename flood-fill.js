function getOffset(i, w) {
  const x = i % w;
  const y = Math.floor(i / w);
  return [x, y];
}

function convertRGBA(data, i) {
  const r = data[i * 4 + 0];
  const g = data[i * 4 + 1];
  const b = data[i * 4 + 2];
  const a = data[i * 4 + 3];
  return [r, g, b, a];
}

function adjacentIndexes(i, w, l) {
  const res = [];
  const top = i >= w ? i - w : null;
  const left = i % w > 0 ? i - 1 : null;
  const right = i % w < w - 1 ? i + 1 : null;
  const bottom = i + w < l ? i + w : null;
  top && res.push(top);
  left && res.push(left);
  right && res.push(right);
  bottom && res.push(bottom);
  return res;
}

export default function floodFill(data, _i, w, l, checker) {
  const checked = new Uint8Array(l);
  const queue = [_i];
  checked[_i] = 1;
  while (true) {
    const i = queue.shift();
    if (typeof i === 'undefined') break;
    const pt = getOffset(i, w);
    const rgba = convertRGBA(data, i);
    if (checker(rgba)) {
      data[i * 4 + 3] = 0;
      adjacentIndexes(i, w, l).forEach(function(adjI) {
        !checked[adjI] && queue.push(adjI);
        checked[adjI] = 1;
      });
    }
  }
  return data;
}