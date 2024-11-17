
{{- define "go-echo8e4fe434-33d9-4c9c-87af-48ae5459905b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8e4fe434-33d9-4c9c-87af-48ae5459905b.fullname" -}}
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


{{- define "go-echo8e4fe434-33d9-4c9c-87af-48ae5459905b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8e4fe434-33d9-4c9c-87af-48ae5459905b.labels" -}}
helm.sh/chart: {{ include "go-echo8e4fe434-33d9-4c9c-87af-48ae5459905b.chart" . }}
{{ include "go-echo8e4fe434-33d9-4c9c-87af-48ae5459905b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8e4fe434-33d9-4c9c-87af-48ae5459905b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8e4fe434-33d9-4c9c-87af-48ae5459905b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}