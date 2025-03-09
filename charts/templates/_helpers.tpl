
{{- define "go-echo62a740b4-6550-4e68-bd6d-ac0765c5c36a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62a740b4-6550-4e68-bd6d-ac0765c5c36a.fullname" -}}
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


{{- define "go-echo62a740b4-6550-4e68-bd6d-ac0765c5c36a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62a740b4-6550-4e68-bd6d-ac0765c5c36a.labels" -}}
helm.sh/chart: {{ include "go-echo62a740b4-6550-4e68-bd6d-ac0765c5c36a.chart" . }}
{{ include "go-echo62a740b4-6550-4e68-bd6d-ac0765c5c36a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo62a740b4-6550-4e68-bd6d-ac0765c5c36a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo62a740b4-6550-4e68-bd6d-ac0765c5c36a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}