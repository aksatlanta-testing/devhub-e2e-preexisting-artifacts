
{{- define "go-echo0a1b9af9-4d3d-4d47-870a-007b3ae8c87b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0a1b9af9-4d3d-4d47-870a-007b3ae8c87b.fullname" -}}
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


{{- define "go-echo0a1b9af9-4d3d-4d47-870a-007b3ae8c87b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0a1b9af9-4d3d-4d47-870a-007b3ae8c87b.labels" -}}
helm.sh/chart: {{ include "go-echo0a1b9af9-4d3d-4d47-870a-007b3ae8c87b.chart" . }}
{{ include "go-echo0a1b9af9-4d3d-4d47-870a-007b3ae8c87b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0a1b9af9-4d3d-4d47-870a-007b3ae8c87b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0a1b9af9-4d3d-4d47-870a-007b3ae8c87b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}