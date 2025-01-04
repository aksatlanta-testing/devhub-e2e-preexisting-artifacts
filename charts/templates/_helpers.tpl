
{{- define "go-echoac16ffa3-cb3d-4e43-9ad9-51c75b311c89.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac16ffa3-cb3d-4e43-9ad9-51c75b311c89.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoac16ffa3-cb3d-4e43-9ad9-51c75b311c89.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac16ffa3-cb3d-4e43-9ad9-51c75b311c89.labels" -}}
helm.sh/chart: {{ include "go-echoac16ffa3-cb3d-4e43-9ad9-51c75b311c89.chart" . }}
{{ include "go-echoac16ffa3-cb3d-4e43-9ad9-51c75b311c89.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac16ffa3-cb3d-4e43-9ad9-51c75b311c89.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac16ffa3-cb3d-4e43-9ad9-51c75b311c89.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}