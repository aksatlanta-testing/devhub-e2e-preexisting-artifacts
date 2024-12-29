
{{- define "go-echof592811b-cedf-43d7-af90-7f0ecc345694.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof592811b-cedf-43d7-af90-7f0ecc345694.fullname" -}}
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


{{- define "go-echof592811b-cedf-43d7-af90-7f0ecc345694.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof592811b-cedf-43d7-af90-7f0ecc345694.labels" -}}
helm.sh/chart: {{ include "go-echof592811b-cedf-43d7-af90-7f0ecc345694.chart" . }}
{{ include "go-echof592811b-cedf-43d7-af90-7f0ecc345694.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof592811b-cedf-43d7-af90-7f0ecc345694.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof592811b-cedf-43d7-af90-7f0ecc345694.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}