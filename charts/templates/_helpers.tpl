
{{- define "go-echod38c486d-2708-4f99-8408-282a4ee86bbd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod38c486d-2708-4f99-8408-282a4ee86bbd.fullname" -}}
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


{{- define "go-echod38c486d-2708-4f99-8408-282a4ee86bbd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod38c486d-2708-4f99-8408-282a4ee86bbd.labels" -}}
helm.sh/chart: {{ include "go-echod38c486d-2708-4f99-8408-282a4ee86bbd.chart" . }}
{{ include "go-echod38c486d-2708-4f99-8408-282a4ee86bbd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod38c486d-2708-4f99-8408-282a4ee86bbd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod38c486d-2708-4f99-8408-282a4ee86bbd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}