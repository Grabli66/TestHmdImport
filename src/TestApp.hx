import h3d.scene.Mesh;


class TestApp extends hxd.App {

    override function init () : Void {        
        var model = hxd.Res.rlauncher.toHmd ();  
        var object = model.makeObject ();
        //var model = hxd.Res.charWorkingFbx.toHmd ();
        //var object = model.makeObject ();
        object.scale (0.5);        

        for (m in object.getMaterials ()) {
            m.color.setColor (0xAAAAAA);
            m.mainPass.enableLights = true;
        }

        var prim = new h3d.prim.Cube();

		// translate it so its center will be at the center of the cube
		prim.translate( -0.5, -0.5, -0.5);

		// unindex the faces to create hard edges normals
		prim.unindex();

		// add face normals
		prim.addNormals();

		// add texture coordinates
		prim.addUVs();

        //var obj1 = new Mesh(prim, s3d);
        

        //s3d.addChild (obj1);
        s3d.addChild (object);

        var dir = new h3d.scene.DirLight(new h3d.Vector(0.2, 0.3, -1), s3d);        
        dir.color.set(0.55, 0.55, 0.55);
        
        s3d.camera.zNear = 1;
        s3d.camera.zFar = 30;

        new h3d.scene.CameraController (5, s3d).loadFromCamera ();
    }

    override function update (dt : Float) {        
    }
}