
{{- define "go-echoe2ba6f98-ec59-4d98-9414-65f9acacaddb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2ba6f98-ec59-4d98-9414-65f9acacaddb.fullname" -}}
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


{{- define "go-echoe2ba6f98-ec59-4d98-9414-65f9acacaddb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2ba6f98-ec59-4d98-9414-65f9acacaddb.labels" -}}
helm.sh/chart: {{ include "go-echoe2ba6f98-ec59-4d98-9414-65f9acacaddb.chart" . }}
{{ include "go-echoe2ba6f98-ec59-4d98-9414-65f9acacaddb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe2ba6f98-ec59-4d98-9414-65f9acacaddb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe2ba6f98-ec59-4d98-9414-65f9acacaddb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}