
{{- define "go-echoa82c1391-454e-4ec5-8adb-f29c5e6b1251.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa82c1391-454e-4ec5-8adb-f29c5e6b1251.fullname" -}}
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


{{- define "go-echoa82c1391-454e-4ec5-8adb-f29c5e6b1251.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa82c1391-454e-4ec5-8adb-f29c5e6b1251.labels" -}}
helm.sh/chart: {{ include "go-echoa82c1391-454e-4ec5-8adb-f29c5e6b1251.chart" . }}
{{ include "go-echoa82c1391-454e-4ec5-8adb-f29c5e6b1251.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa82c1391-454e-4ec5-8adb-f29c5e6b1251.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa82c1391-454e-4ec5-8adb-f29c5e6b1251.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}