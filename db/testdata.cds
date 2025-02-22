namespace leela1.db;

//Aspects -- resusable aspects which can be used anyone in the team
using { leelacapapp.commons as commons } from './commons';

//Standard aspect provided by SAP
using { cuid, temporal, managed } from '@sap/cds/common';



context master {

//using standard aspects
    entity student: commons.strAddress, managed {
        key studentId: commons.Guid;
        name: String(60);
        class: Association to one standard;
        gender: String(1);
        familyName: String(30);
    }

//using standard aspects
    entity standard: temporal{
        key Id: commons.Guid;
        classname: localized String(10);
        sections: commons.Guid;
    }

//using standard aspects
    entity marks: cuid {
        stu: Association to one student;
        marks: Int16;
    }
}