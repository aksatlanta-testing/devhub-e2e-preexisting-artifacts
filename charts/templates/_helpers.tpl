
{{- define "go-echo7676a0f9-9c57-4c3d-b938-d2ca98c92c00.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7676a0f9-9c57-4c3d-b938-d2ca98c92c00.fullname" -}}
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


{{- define "go-echo7676a0f9-9c57-4c3d-b938-d2ca98c92c00.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7676a0f9-9c57-4c3d-b938-d2ca98c92c00.labels" -}}
helm.sh/chart: {{ include "go-echo7676a0f9-9c57-4c3d-b938-d2ca98c92c00.chart" . }}
{{ include "go-echo7676a0f9-9c57-4c3d-b938-d2ca98c92c00.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7676a0f9-9c57-4c3d-b938-d2ca98c92c00.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7676a0f9-9c57-4c3d-b938-d2ca98c92c00.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}