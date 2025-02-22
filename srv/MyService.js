module.exports = (cds) => {
    cds.on('hello', (req) => {

        return "Welcome " + req.data.name + " Welcome to CAP "
    });

const { ReadEmployeeSrv } = cds.entities;

cds.on('READ', ReadEmployeeSrv, () => {
    let aData = [];
    aData.push({
        "ID": "02BD2137-0890-1EEA-A6C2-BB55C198E8DW",
      "nameFirst": "Shree",
      "nameMiddle": "Saanvi",
    });
    aData.push({
        "ID": "02BD2137-0890-1EEA-A6C2-BB55C198E8DQ",
      "nameFirst": "Pravya",
      "nameMiddle": "Vahni",
    });
    return aData;
});
}





