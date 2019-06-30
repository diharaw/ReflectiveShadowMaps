// ------------------------------------------------------------------
// INPUT VARIABLES --------------------------------------------------
// ------------------------------------------------------------------

layout(location = 0) in vec3 VS_IN_Position;
layout(location = 1) in vec2 VS_IN_Texcoord;
layout(location = 2) in vec3 VS_IN_Normal;
layout(location = 3) in vec3 VS_IN_Tangent;
layout(location = 4) in vec3 VS_IN_Bitangent;

// ------------------------------------------------------------------
// OUTPUT VARIABLES -------------------------------------------------
// ------------------------------------------------------------------

out vec3 FS_IN_WorldPos;
out vec3 FS_IN_Normal;
out vec2 FS_IN_TexCoord;

// ------------------------------------------------------------------
// UNIFORMS ---------------------------------------------------------
// ------------------------------------------------------------------

layout(std140) uniform GlobalUniforms
{
    mat4 view_proj;
    mat4 light_view_proj;
    vec4 cam_pos;
};

layout(std140) uniform ObjectUniforms
{
    mat4 model;
};

// ------------------------------------------------------------------
// MAIN -------------------------------------------------------------
// ------------------------------------------------------------------

void main()
{
    vec4 world_pos = model * vec4(VS_IN_Position, 1.0f);
    FS_IN_WorldPos = world_pos.xyz;

    mat3 model_mat = mat3(model);

    FS_IN_Normal   = normalize(model_mat * VS_IN_Normal);
    FS_IN_TexCoord = VS_IN_Texcoord;

    gl_Position = view_proj * world_pos;
}

// ------------------------------------------------------------------
