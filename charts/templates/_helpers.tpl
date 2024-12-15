
{{- define "go-echo02359f5a-a743-4a3d-ac29-86d26ce2f36f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo02359f5a-a743-4a3d-ac29-86d26ce2f36f.fullname" -}}
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


{{- define "go-echo02359f5a-a743-4a3d-ac29-86d26ce2f36f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo02359f5a-a743-4a3d-ac29-86d26ce2f36f.labels" -}}
helm.sh/chart: {{ include "go-echo02359f5a-a743-4a3d-ac29-86d26ce2f36f.chart" . }}
{{ include "go-echo02359f5a-a743-4a3d-ac29-86d26ce2f36f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo02359f5a-a743-4a3d-ac29-86d26ce2f36f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo02359f5a-a743-4a3d-ac29-86d26ce2f36f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}