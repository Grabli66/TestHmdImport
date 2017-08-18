import h3d.scene.Mesh;


class TestApp extends hxd.App {

    /**
     *  Scene object
     */
    var object : h3d.scene.Object;

    /**
     *  Rotate angle
     */
    var angle : Float;

    /**
     *  On game init
     */
    override function init () : Void {
        angle = 0;
        var model = hxd.Res.skel.toHmd ();        
        object = model.makeObject ();

        //var texture = hxd.Res.milktank_tex.toTexture ();
        //var model = hxd.Res.charWorkingFbx.toHmd ();
        //var object = model.makeObject ();

        for (m in object.getMaterials ()) {            
            //m.texture = texture;
            m.mainPass.enableLights = true;
        }

        object.scale (0.08);

        //var prim = new h3d.prim.Cube();

        var anim = model.loadAnimation ();
        object.playAnimation (anim);

		// translate it so its center will be at the center of the cube
		//prim.translate( -0.5, -0.5, -0.5);

		// unindex the faces to create hard edges normals
		//prim.unindex();

		// add face normals
		//prim.addNormals();

		// add texture coordinates
		//prim.addUVs();

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
        angle += 1;
        //object.rotate (1 * 3.14 / 180, 0, 0);

        if (angle > 360) angle = 0;

    }
}