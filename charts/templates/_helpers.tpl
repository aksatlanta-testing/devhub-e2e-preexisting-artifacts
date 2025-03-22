
{{- define "go-echo103c1446-5557-4ad7-badb-f9bba8a4aeac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo103c1446-5557-4ad7-badb-f9bba8a4aeac.fullname" -}}
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


{{- define "go-echo103c1446-5557-4ad7-badb-f9bba8a4aeac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo103c1446-5557-4ad7-badb-f9bba8a4aeac.labels" -}}
helm.sh/chart: {{ include "go-echo103c1446-5557-4ad7-badb-f9bba8a4aeac.chart" . }}
{{ include "go-echo103c1446-5557-4ad7-badb-f9bba8a4aeac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo103c1446-5557-4ad7-badb-f9bba8a4aeac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo103c1446-5557-4ad7-badb-f9bba8a4aeac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}