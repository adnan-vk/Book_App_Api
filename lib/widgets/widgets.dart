import 'package:flutter/material.dart';

textformfield({controller, labeltext, onchange}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      labelText: labeltext,
    ),
    onChanged: onchange,
  );
}

text({data, color, backgroundcolor, weight, size, align}) {
  return Text(
    data,
    style: TextStyle(
        color: color,
        backgroundColor: backgroundcolor,
        fontWeight: weight,
        fontSize: size),
    textAlign: align,
  );
}
